import Quickshell
import QtQuick
import QtQuick.Layouts

ShellRoot {

    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 40
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
		    color: "transparent"
                    Left {}
                }

                Item { Layout.fillWidth: true }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
		    color: "transparent"
                    Center {}
                }

                Item { Layout.fillWidth: true }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
		    color: "transparent"
		    Right {}
                }
            }
        }
    }
}
