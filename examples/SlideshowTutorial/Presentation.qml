import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import Slideshow 1.0 as SS
import "." as App

SS.Presentation {
    title: "QML Slideshow Tutorial"

    App.Slide {
//        id: slide

        text: slide.numbering.total + " Slides"

//        bottomLeft: GridLayout {
//            implicitHeight: childrenRect.height
//            implicitWidth: childrenRect.width
////            width: slide.content.width
//            columns: 2
//            Rectangle {
//                width: slide.content.width / 6
//                height: width
//                color: "Orange"
//            }
//            Rectangle {
//                width: slide.content.width / 8
//                height: width
//                color: "Yellow"
//            }
//        }

        bottomRight: Rectangle {
            width: slide.content.width / 8
            height: width
            color: "Green"
        }

        Rectangle {
            width: slide.content.width / 4
            height: width
            color: "Red"
        }
        Rectangle {
            width: slide.content.width / 8
            height: width
            color: "Blue"
        }
    }

    App.Slide {
        body.color: "Transparent"
        footer.visible: false;
        header.visible: false;

        gradient: Gradient {
            GradientStop { position: 0.0; color: "White" }
            GradientStop { position: 1.0; color: "Silver" }
        }

        text: slide.presentation.title
        textHeight: Math.floor(slide.height * 0.10)

//        SS.TitleText {
//            anchors.centerIn: slide
//            text: slide.presentation.title
//        }
    }

    App.Slide {
        text: "This is the simplest slide you can create."
    }

    App.Slide {
        text: "
This is also a simple slide, only it has lots of text. Even though it has a
lot of text, the text will wrap at word boundaries so it all fits inside
the body of the slide, up to a point...
"
    }

    App.Slide {
        text: "
It will even do text.trim().split(\"\\n\").join(\" \") for you.
And set the horizontal alignment when the line count is greater than one,
switching from centered to left aligned.
"
    }

    App.Slide {
        Text {
            text: "QtQuick Text component with no modfication."
        }
    }

    App.ColorDeck {  }

    /*

    App.Slide {
        Text {
            width: parent.body.width
            anchors.verticalCenter: parent.body.verticalCenter
            anchors.horizontalCenter: parent.body.horizontalCenter
            font.pixelSize: parent.height * 0.07
//            horizontalAlignment: Text.AlignHCenter
            text: "
Qualities of a good system:
* Simplicity
* Flexibility
* Power
".trim()
            wrapMode: Text.WordWrap
        }
    }

    App.Slide {
        Text {
            anchors.fill: parent.body
            font.pixelSize: parent.height * 0.07
            text: "
Are asterisks as good as bullets?
* Yes
* No
* Sometimes
".trim()
            wrapMode: Text.WordWrap
        }
    }

    App.Slide {
        Text {
            anchors.fill: parent.body
            font.pixelSize: parent.height * 0.07
            text: "
Are bullets worth fighting for?
* No
* Yes
* Depends
".trim()
            wrapMode: Text.WordWrap
        }
    }

    App.Slide {
        Text {
            width: parent.body.width
        }
    }

    App.Slide {
        footer.visible: false;
        header.visible: false;

        onVisibleChanged: {
            if (visible) {
                cone.increment = -cone.increment;
                cone.angle = 90;
                waitForIt.start();
            } else {
                waitForIt.stop();
                goForIt.stop();
                spin.stop();
            }
        }

        ConicalGradient {
            id: cone
            property int increment: -1
            anchors.fill: parent
            angle: 90
            horizontalOffset: Math.round(parent.width * -0.3)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "Black" }
                GradientStop { position: 1.0; color: "White" }
            }
        }

        Timer {
            id: spin
            interval: 100
            repeat: true
            onTriggered: cone.angle += cone.increment;
        }

        Timer {
            id: goForIt
            interval: 500
            repeat: true
            triggeredOnStart: true
            onTriggered: {
                if (spin.running) {
                    cone.horizontalOffset += cone.increment;
                    spin.interval = Math.max(spin.interval - 1, 10);
                } else {
                    spin.start();
                }
            }
        }

        Timer {
            id: waitForIt
            interval: 5000
            repeat: false
            onTriggered: goForIt.start();
        }

        SS.TitleText {
            width: slide.body.width * 0.7
            y: (slide.height / 2 - height)
            anchors.right: slide.body.right
            horizontalAlignment: Text.AlignRight
            style: Text.Sunken
            styleColor: "White"
            text: slide.presentation.title
        }
    }

    App.Slide {
        body.color: "Red"
        body.margin: width / 10

        Rectangle {
            anchors.fill: parent.body
            anchors.margins: parent.body.margin
            color: "Blue"
        }
    }

//    App.Slide {
//        Column {
//            width: parent.body.width
//            anchors.centerIn: parent.body
//            spacing: parent.margin

//            SS.Text {
//                text: "This is some text."
//            }
//            SS.Text {
//                width: parent.width
//                text: "This is some text that begins with a paragraph full " +
//                      "of words, and is followed by some HTML bullets:"
//            }
//            SS.Text {
//                text: "<ul>" +
//                      "<li>One</li>" +
//                      "<li>Two</li>" +
//                      "<li>Three</li>" +
//                      "</ul>"
//            }
//        }
////        ColumnLayout {
////            anchors.centerIn: parent.body
////            implicitHeight: childrenRect.height
////            implicitWidth: childrenRect.width
////            spacing: parent.margin
////            SS.Text {
////                text: "This is some text with bullets:"
////                Layout.fillWidth: true
////            }
//////            SS.Text {
//////                text: "<ul>" +
//////                      "<li>One</li>" +
//////                      "<li>Two</li>" +
//////                      "<li>Three</li>" +
//////                      "</ul>"
//////            }
////        }
//    }

    Item {
        id: deck
        property string header: "Inline Nested Slides: ROYGBIV"
        property int pixelSize: Math.round(parent.height * 0.25)

        App.Slide {
            header.text: deck.header
            body.color: "Red"
            SS.Text {
                anchors.centerIn: slide.body
                font.pixelSize: deck.pixelSize
                text: "Red Again"
            }
        }

        App.Slide {
            header.text: deck.header
            header.color: "Transparent"
            footer.color: "Transparent"
            header.line.visible: false
            footer.line.visible: false
            footer.leftText: ""
            footer.text: numbering.text
            numbering.format: "Slide %1 is " + color + ", also known as Orange"
            footer.rightText: ""
            color: "Orange"
            radius: deck.pixelSize / 2
            body.color: "Black"
            body.radius: deck.pixelSize
//            Rectangle {
//                width: Math.round(Math.min(parent.width, parent.height) * 0.6)
//                height: width
//                radius: width / 2
//                color: "Orange"
//                anchors.centerIn: parent.body
//            }
//            SS.Text {
//                anchors.centerIn: slide.body
//                font.pixelSize: deck.pixelSize / 2
//                text: slide.color
//            }
        }

        Item {
            id: deck2

            App.Slide {
                header.text: deck.header
                body.color: "Yellow"
                SS.Text {
                    anchors.bottom: slide.body.bottom
                    anchors.right: slide.body.right
                    color: "Red"
                    font.pixelSize: Math.round(parent.height * 0.05)
                    text: "%1 (%2, %3)".arg(slide.body.color).arg(
                              slide.body.width).arg(slide.body.height)
                }
            }

            App.Slide {
                header.text: deck.header
                body.color: "Green"
            }

            App.Slide {
                header.text: deck.header
                body.color: "Blue"
            }
        }

        App.Slide {
            header.text: deck.header
            body.color: "Indigo"
        }

        Item {
            id: deck3

            App.Slide {
                header.text: deck.header
                body.color: "Violet"
            }
        }
    }

    App.Slide {
        body.visible: false

        header.text: "Easy Header & Footer Customization"
        header.gradient: Gradient {
            GradientStop { position: 0.0; color: "Black" }
            GradientStop { position: 1.0; color: "Blue" }
        }
        header.font.bold: true
        header.textColor: "White"
        header.textHeight: Math.floor(height * 0.07)
        header.line.visible: false
        header.margin: margin * 2

        footer.color: "Yellow"
        footer.line.width: width
//        footer.dateText.visible: true
//        footer.dateText.format: Locale.LongFormat
//        footer.timeText.format: Locale.LongFormat
//        footer.timeText.updateInterval: 60
//        footer.timeText.font.bold: true
//        footer.slideNumber.format: "Slide %1 of %2"
    }

    Repeater {
        id: repeater

        model: 10

        App.Slide {
            SS.TitleText {
                anchors.centerIn: slide.body
                text: "Repeater Delegate " + (index + 1) +
                      " of " + repeater.model
            }
        }
    }
// */
}
