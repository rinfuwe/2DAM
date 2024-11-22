import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Rectangle {
    id: view
    property alias title: titleLabel.text
    property alias contentComponent: contentLoader.sourceComponent // Permitir la carga de contenido dinámico
    property alias editNameFieldText: editNameField.text // Alias para el texto del campo de nombre
    property alias editDescriptionFieldText: editDescriptionField.text // Alias para el texto del campo de descripción

    color: "#f0f0f0"
    anchors.fill: parent

    ColumnLayout {
        anchors.fill: parent
        spacing: 10
        anchors.margins: 20

        Text {
            id: titleLabel
            text: "Título"
            font.bold: true
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Loader {
            id: contentLoader
            Layout.fillWidth: true
            Layout.fillHeight: true
            sourceComponent: view.contentComponent // Cargar contenido dinámico
        }
    }
}
