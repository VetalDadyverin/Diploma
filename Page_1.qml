
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.0
import QtQuick 2.2
import QtQuick.Dialogs 1.3


Page{
    id: page1
    property int margin_1 : 16
    property bool buff : true
    //property alias backgroundColor: value


    background: Rectangle {
        id: backgroundRect
    }


    FileDialog {
        id: fileDialog
        title : "Choose File Attachment"
        folder : shortcuts.home
        onAccepted : {
            attachments.text = fileDialog.fileUrl
            console.log("added attachment: " + fileDialog.fileUrls)
            pic.source = fileDialog.fileUrl
            file_name = fileDialog.fileUrl
            console.log("hhhhhere")
            CppClass.make_name(file_name)
            file_name1 = CppClass.get_name1()
            file_name2 = CppClass.get_name2()
            //next1_button.visible = true
        }
    }


    DropArea{
        id: drop
        enabled : true
        anchors.fill : parent
        //anchors.margins: margin
        Rectangle {
            anchors.fill: parent
            color : Qt.rgba(Math.random(), Math.random(),Math.random());
            visible: parent.containsDrag
        }
        onEntered: console.log("entered DropArea")
        onDropped : {
            attachments.text = drop.text
            console.log("added attachment: " + drop.text)
            console.log("drag.source: " + drag.source)
            pic.source = drop.text
            file_name = drop.text
            console.log("hhhhhere")
            //CppClass.make_name(file_name)
            console.log("aaaaaaaaa")
            file_name1 = CppClass.get_name1()
            file_name2 = CppClass.get_name2()
            console.log("HHHHHHHHHHHH")
            console.log(CppClass.get_name1())
            console.log(CppClass.get_name2())
            //next1_button.visible = true
        }

        GroupBox {
            id: rowBox
            anchors.top : parent.top
            anchors.horizontalCenter : parent.horizontalCenter
            anchors.topMargin : 0.0125 * (parent.height - rowBox.height)
            width : 0.95 * parent.width
            height : 0.95 * (parent.height - rowBox1.height)
            background : Rectangle {

                width: parent.width
                height : parent.height
                color : "transparent"
                border.color : "black"
                border.width : 0.0015 * parent.width
                radius : 10
            }

            Row {
                id: rowLayout
                anchors.fill : parent
                spacing : 6
                /*Button {
                    id: attach_button
                    anchors.verticalCenter : parent.verticalCenter
                    text : "Attach"
                    onClicked : fileDialog.open();

                }*/
                Button {
                    id: attach_button
                    anchors.verticalCenter : parent.verticalCenter
                    text : "Attach"
                    width: parent.width * 0.15
                    height : parent.height * 0.1
                    background : Rectangle {
                        id: rect_
                        width : parent.width
                        height : parent.height
                        color:  mouseArea_attach.containsPress ? Qt.darker("lightgrey", 1.5) : "lightgrey";
                        border.color : "black"
                        border.width : 0.0015 * rowLayout.width
                        radius : 6
                        MouseArea{
                            id: mouseArea_attach
                            anchors.fill: parent
                            onClicked : {
                                fileDialog.open();
                                name1.visible = true
                            }
                        }
                    }
                }

                Item{
                    id: item_pic
                    height : 0.8 * parent.height
                    width : 0.4 * parent.width
                    anchors.verticalCenter : parent.verticalCenter
                    //Layout.margins: margin_1*0.5
                    Image {
                        id: pic
                        source : "file:///D:/Diploma/Diploma/Diploma/drop.png"
                        visible : true //hidden by default
                        anchors.fill : parent
                    }
                    BorderImage {
                        id: name1
                        source: "file:///D:/Diploma/Diploma/Diploma/border.png"
                        width: parent.width; height: parent.height
                        border.left: -1; border.top: -3
                        border.right: -1; border.bottom: -3
                        visible: false
                    }
                }

                TextArea {
                    id: attachments
                    background : Rectangle {

                        width: parent.width
                        height : parent.height
                        color : "transparent"
                        border.color : "black"
                        border.width : 0.0015 * parent.width
                        radius : 10
                    }
                    anchors.verticalCenter: parent.verticalCenter
                    text : "Here will be path of your photo"
                    height : 0.95 * parent.height
                    width : 0.95 * (parent.width - attach_button.width - item_pic.width)
                }

            }
        }

    }

    GroupBox {
        id: rowBox1
        height : parent.height * 0.08
        width : parent.width / 3
        anchors.bottom : parent.bottom
        anchors.horizontalCenter : parent.horizontalCenter
        anchors.bottomMargin : 0.025 * (parent.height - rowBox1.height)
        background : Rectangle {
            width: parent.width
            height : parent.height
            color : "transparent"
            border.color : "black"
            border.width : 0.0015 * rowBox.width
            radius : 10
        }
        Row {
            //anchors.right: parent.right
            height: parent.height
            width : parent.width
            anchors.centerIn : parent
            spacing : 10
            id : rowLayout1
            Button {
                id: next_button
                anchors.left : parent.left
                text : "Next"
                visible : true
                width: parent.width * 0.2
                height : parent.height
                background : Rectangle {
                    id: rect
                    width : parent.width
                    height : parent.height
                    color:  mouseArea_next.containsPress ? Qt.darker("lightgrey", 1.5) : "lightgrey";
                    border.color : "black"
                    border.width : 0.0015 * rowLayout.width
                    radius : 4
                    MouseArea{
                        id: mouseArea_next
                        anchors.fill: parent
                        onClicked : {
                            stack_view.push(page2)
                        }
                    }
                }
            }
            Button {
                id: exit_button
                anchors.right : parent.right
                width : parent.width * 0.2
                height : parent.height
                background : Rectangle {
                    width: parent.width
                    height : parent.height
                    color:  mouseArea_exit.containsPress ? Qt.darker("lightgrey", 1.5) : "lightgrey";
                    border.color : "black"
                    border.width : 0.0015 * rowLayout.width
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
