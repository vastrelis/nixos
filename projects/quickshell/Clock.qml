import Quickshell
import Quickshell.Io // for Process
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

ColumnLayout {
	anchors.fill: parent
	Text {
		Layout.fillHeight: true
      id: clockDate

      Process {
        id: dateProc

        command: ["date", "+%d.%m.%Y"]
        running: true

        stdout: StdioCollector {
        onStreamFinished: clockDate.text = this.text
      }
    }
}

	
	Text {
      id: clockTime
      Layout.fillHeight: true

      Process {
        id: timeProc

        command: ["date", "+%H:%M"]
        running: true

        stdout: StdioCollector {
        onStreamFinished: clockTime.text = this.text
      }
    }

    Timer {
      interval: 1000

      running: true

      repeat: true

      onTriggered: {
      	dateProc.running = true
	timeProc.running = true
      }
      }
    }
}


