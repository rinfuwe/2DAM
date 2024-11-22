import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Gestión de Tareas")
    color: "#ffffff"

    ListModel {
        id: tareasModel
        ListElement { name: "Tarea 1"; description: "Realizar tareas de programación"; priority: 1 }
        ListElement { name: "Tarea 2"; description: "Revisar correos pendientes"; priority: 1 }
        ListElement { name: "Tarea 3"; description: "Planificar la semana"; priority: 1 }
    }

    property int editingIndex: -1 // Índice de la tarea que se edita (-1 si no se está editando)

    RowLayout {
        anchors.fill: parent

        ColumnLayout {
            id: menu
            width: 150
            spacing: 10

            Rectangle {
                color: "#e0e0e0"
                width: parent.width
                height: 50
                Button {
                    text: "Elementos"
                    anchors.centerIn: parent
                    onClicked: stackLayout.currentIndex = 0
                }
            }
            Rectangle {
                color: "#e0e0e0"
                width: parent.width
                height: 50
                Button {
                    text: "Edición"
                    anchors.centerIn: parent
                    onClicked: {
                        resetEditView()
                        stackLayout.currentIndex = 1
                    }
                }
            }
            Rectangle {
                color: "#e0e0e0"
                width: parent.width
                height: 50
                Button {
                    text: "Usuarios"
                    anchors.centerIn: parent
                    onClicked: stackLayout.currentIndex = 2
                }
            }
            Rectangle {
                color: "#e0e0e0"
                width: parent.width
                height: 50
                Button {
                    text: "Configuración"
                    anchors.centerIn: parent
                    onClicked: stackLayout.currentIndex = 3
                }
            }
        }

        StackLayout {
            id: stackLayout
            Layout.fillWidth: true
            Layout.fillHeight: true
            currentIndex: 0

            // Vista de elementos
            View {
                title: "Elementos"
                contentComponent: Component {
                    GridView {
                        id: gridView
                        anchors.fill: parent
                        cellWidth: 250
                        cellHeight: 150
                        model: tareasModel

                        delegate: Rectangle {
                            width: gridView.cellWidth - 20 // Reduce el espacio para el espaciado horizontal
                            height: gridView.cellHeight - 20
                            color: "#e0e0e0"
                            radius: 10
                            border.color: "#cccccc"

                            ColumnLayout {
                                anchors.fill: parent
                                anchors.margins: 10
                                spacing: 10

                                Text {
                                    text: model.name
                                    font.bold: true
                                    font.pointSize: 14
                                    horizontalAlignment: Text.AlignHCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    elide: Text.ElideRight
                                }

                                Text {
                                    text: model.description
                                    font.pointSize: 12
                                    color: "#555555"
                                    horizontalAlignment: Text.AlignHCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    elide: Text.ElideRight
                                }

                                RowLayout {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    spacing: 10

                                    Button {
                                        text: "Modificar"
                                        onClicked: {
                                            editNameField.text = model.name
                                            editDescriptionField.text = model.description
                                            editingIndex = index
                                            editButton.text = "Modificar tarea"
                                            stackLayout.currentIndex = 1
                                        }
                                    }
                                    Button {
                                        text: "Eliminar"
                                        onClicked: {
                                            tareasModel.remove(index)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Vista de edición
            View {
                id: editView
                title: "Edición"
                contentComponent: Component {
                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 20

                        TextField {
                            id: editNameField
                            placeholderText: "Nombre de la tarea"
                        }
                        TextField {
                            id: editDescriptionField
                            placeholderText: "Descripción de la tarea"
                        }
                        Button {
                            id: editButton
                            text: "Crear Tarea"
                            width: 150
                            height: 40
                            onClicked: {
                                if (editView.editNameFieldText !== "" && editView.editDescriptionFieldText !== "") {
                                    if (editingIndex !== -1) {
                                        tareasModel.set(editingIndex, {
                                            name: editView.editNameFieldText,
                                            description: editView.editDescriptionFieldText,
                                            priority: tareasModel.get(editingIndex).priority
                                        })
                                        editingIndex = -1
                                    } else {
                                        tareasModel.append({
                                            name: editView.editNameFieldText,
                                            description: editView.editDescriptionFieldText,
                                            priority: 1
                                        })
                                    }
                                    resetEditView()
                                    stackLayout.currentIndex = 0
                                } else {
                                    console.log("Por favor, rellena todos los campos.")
                                }
                            }
                        }
                    }
                }
            }


            // Vista de usuarios

            View{
                title: "Usuarios"
                contentComponent: Component {
                    Text {
                        anchors.centerIn: parent
                        text: "Usuarios"
                    }
                }
            }

            // Vista de configuración
            View {
                title: "Configuración"
                contentComponent: Component {
                    Text {
                        anchors.centerIn: parent
                        text: "Configuración"
                    }
                }
            }
        }
    }

    function resetEditView() {
        editView.editNameFieldText = ""
        editView.editDescriptionFieldText = ""
        editButton.text = "Crear Tarea"
        editingIndex = -1
    }
}

/*##^##
Designer {
    D{i:0}D{i:7;invisible:true}
}
##^##*/
