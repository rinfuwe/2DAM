import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Rectangle {
    id: view
    property alias title: titleLabel.text
    property Component contentComponent: null // Permite cargar contenido dinámico

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
            sourceComponent: view.contentComponent // Carga el contenido dinámico
        }
    }
}
