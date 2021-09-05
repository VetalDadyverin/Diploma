import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.0
import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.3

Page {
    id: page4
    property int margin: 16
    //property alias backgroundColor: value
    property bool button__1: false
    property bool button__2: false


    background: Rectangle {
        id: backgroundRect
    }

    FileDialog {
        id: fileDialog1
        title : "Choose File Attachment"
        folder : shortcuts.home
        onAccepted : {
            if(which == "first"){
                CppClass.make_render(fileDialog1.fileUrl)
                render_name = CppClass.get_render()
            }
            if(which == "second"){
                CppClass.make_picture(fileDialog1.fileUrl)
                picture_name = CppClass.get_picture()

            }
        }
    }


    GroupBox {
        id: rowBox2
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 0.0125 * (parent.height - rowBox3.height)
        width: 0.95*parent.width
        height: 0.95 * (parent.height - rowBox3.height)
        background: Rectangle {

                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: "black"
                border.width: 0.0015 * parent.width
                radius: 10
            }
        Row {
            id: rowLayout
            anchors.top : parent.top
            anchors.horizontalCenter : parent.horizontalCenter
            Layout.fillWidth : parent
            height : 0.7 * rowBox2.height
            width : 0.75 * rowBox2.width
            //spacing: 6
            Item{
                id: item_pic1
                height : 0.7 * rowBox2.height
                width : 0.35 * rowBox2.width
                anchors.left : parent.left
                Image {
                    id: pic1
                    source :  render_name + ".jpg"
                    visible : true //hidden by default
                    anchors.fill : parent
                }
                BorderImage {
                    id: name1
                    source: "file:///D:/Diploma/Diploma/Diploma/border.png"
                    width: parent.width; height: parent.height
                    border.left: -1; border.top: -3
                    border.right: -1; border.bottom: -3
                }
            }

            Item{
                id: item_pic2
                height : 0.7 * rowBox2.height
                width : 0.35 * rowBox2.width
                anchors.right : parent.right
                //anchors.verticalCenter: parent.verticalCenter
                //Layout.margins: margin_1*0.5

                Image {
                    id: pic2
                    source : button__2 ? picture_name + ".jpg" : "file:///D:/Diploma/Diploma/Diploma/boat.jpg"
                    visible : true //hidden by default
                    anchors.fill : parent

                }
                BorderImage {
                    id: name
                    source: "file:///D:/Diploma/Diploma/Diploma/border.png"
                    width: parent.width; height: parent.height
                    border.left: 0; border.top: 0
                    border.right: 0; border.bottom: 0
                }
            }
        }
        Row {
            //anchors.left: parent.left
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom : parent.bottom
            //width: parent.width/2
            id : rowLayout2

            Item{
                id: detect_button
                //anchors.right : rowBox2.right
                width : rowBox2.height * 0.2
                height: rowBox2.height * 0.2
                Rectangle{
                    anchors.fill: parent
                    radius: width / 2
                    border.width : 0.0015 * rowBox2.width
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: mouseArea_custom.containsPress ? Qt.darker("lightgreen", 1.5) : "lightgreen"
                        }
                        GradientStop {
                            position: 0.6
                            color: mouseArea_custom.containsPress ? Qt.darker("green", 1.5) : "green"
                        }
                    }
                    Text{
                        anchors.centerIn: parent
                        text: qsTr("Download \n   render")
                        font.pointSize: parent.width*0.08
                        font.bold: true
                    }

                    MouseArea{
                        id: mouseArea_custom
                        anchors.fill: parent
                        onClicked: {
                            which = "first"
                            fileDialog1.open();
                            button__1 = true
                        }
                    }

                }
            }
            Item{
                //anchors.right : rowBox2.right
                width : rowBox2.height * 0.55
                height: rowBox2.height * 0.2
            }
            Item{
                id: detect_button1
                //anchors.right : rowBox2.right
                width : rowBox2.height * 0.2
                height: rowBox2.height * 0.2

                Rectangle{
                    anchors.fill: parent
                    radius: width / 2
                    border.width : 0.0015 * rowBox2.width
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: mouseArea_custom1.containsPress ? Qt.darker("lightgreen", 1.5) : "lightgreen"
                        }
                        GradientStop {
                            position: 0.6
                            color: mouseArea_custom1.containsPress ? Qt.darker("green", 1.5) : "green"
                        }
                    }
                    Text{
                        anchors.centerIn: parent
                        text: qsTr(" Download \n      your \n    picture")
                        font.pointSize: parent.width*0.08
                        font.bold: true
                    }

                    MouseArea{
                        id: mouseArea_custom1
                        anchors.fill: parent
                        onClicked: {
                            which = "second"
                            fileDialog1.open();
                            button__2 = true
                        }
                    }

                }
            }
        }
    }


    GroupBox {
        id: rowBox3
        height : parent.height * 0.08
        width : parent.width / 3
        anchors.bottom : parent.bottom
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.bottomMargin : 0.025 * (parent.height - rowBox3.height)
        background : Rectangle {
            width: parent.width
            height : parent.height
            color : "transparent"
            border.color : "black"
            border.width : 0.0015 * rowBox2.width
            radius : 10
        }
        Row {
            //anchors.right: parent.right
            height: parent.height
            width : parent.width
            anchors.centerIn : parent
            spacing : 10
            id : rowLayout3
            Button {
                property color color1: "lightgrey"
                id: back_button
                text : "Back"
                width : parent.width * 0.2
                height : parent.height
                background : Rectangle {
                    width: parent.width
                    height : parent.height
                    color:  mouseArea_back.containsPress ? Qt.darker(back_button.color1, 1.5) : back_button.color1;
                    border.color : "black"
                    border.width : 0.0015 * rowBox2.width
                    radius : 4
                    MouseArea{
                        id: mouseArea_back
                        anchors.fill: parent
                        onClicked : {
                            stack_view.pop()
                        }
                    }
                }
                visible: true
            }
            Button {
                id: next1_button
                anchors.centerIn : parent

                Text {
                    id:text1
                    text : "Next"
                    anchors.centerIn : parent
                    color : "black"
                }

                visible: true
                width: parent.width * 0.2
                height : parent.height
                background : Rectangle {
                    id: rect1
                    width : parent.width
                    height : parent.height
                    color:  mouseArea_next.containsPress ? Qt.darker(back_button.color1, 1.5) : back_button.color1;
                    border.color : "black"
                    border.width : 0.0015 * rowBox2.width
                    radius : 4
                    MouseArea{
                        id: mouseArea_next
                        anchors.fill: parent
                        onClicked : {
                            stack_view.push(page5)
                        }
                    }
                }
            }
            Button {
                id: exit1_button
                anchors.right : parent.right
                width : parent.width * 0.2
                height : parent.height
                background : Rectangle {
                    width: parent.width
                    height : parent.height
                    color:  mouseArea_exit.containsPress ? Qt.darker(back_button.color1, 1.5) : back_button.color1;
                    border.color : "black"
                    border.width : 0.0015 * rowBox2.width
                    radius : 4
                    MouseArea{
                        id: mouseArea_exit
                        anchors.fill: parent
                        onClicked : {
                            Qt.quit()
                        }
                    }
                }
                text: "Exit"
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
