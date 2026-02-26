import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Rectangle {
	anchors.fill: parent
	Layout.fillWidth: true
	Layout.fillHeight: true	
	color: "red"

	property var lastEvent: null

	function checkEvent(event) {
		if (event.WorkspacesChanged) {
			lastEvent = "Changed Workspace"
		}

		if (event.WindowOpenedOrChanged) {
			lastEvent = "Opened Window"
		}
	}

	Socket {
		id: nirisocket
		path: Quickshell.env("NIRI_SOCKET")

		parser: SplitParser {
			onRead: msg => {
				checkEvent(JSON.parse(msg))
			}
		}
	}

	Component.onCompleted: {
		nirisocket.connected = true
		nirisocket.write("\"EventStream\"\n")
		nirisocket.flush()
	}

	Text {
		anchors.fill: parent
		color: "white"
		text: lastEvent ? JSON.stringify(lastEvent, null, 2) : "Waiting..."
	}
}
