import QtQuick
import QtQuick.Layouts

Canvas {
    id: slice
    anchors.left: parent
    width: parent.width
    height: parent.height

    property int cut: 50

    onPaint: {
	let ctx = getContext("2d")
	ctx.clearRect(0, 0, width, height)

	ctx.beginPath()
	ctx.moveTo(0, 0)
	ctx.lineTo(width, 0)
	ctx.lineTo(width - cut, height)
	ctx.lineTo(0, height)
	ctx.closePath()

	ctx.fillStyle = "rgba(0,0,0,0.8)"
	ctx.fill()

	ctx.beginPath()
	ctx.moveTo(0, height)
	ctx.lineTo(width - cut, height)
	ctx.lineWidth = 2
	ctx.strokeStyle = "#3658B3"
	ctx.stroke()

	ctx.beginPath()
	ctx.moveTo(width, 0)
	ctx.lineTo(width - cut, height)
	ctx.lineWidth = 1.25
	ctx.stroke()
    }

    onWidthChanged: requestPaint()
}
