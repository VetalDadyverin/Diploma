import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Page {
    id: page3
    property int margin: 16
    property bool button__1: false
    property bool button__2: false

        //property alias backgroundColor: value


        background: Rectangle {
            id: backgroundRect
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
                        source : button__1 ? file_name1 + "_bw." + file_name2 : "file:///D:/Diploma/Diploma/Diploma/boat.jpg"
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
                        source : button__2 ? file_name1 + "_grid." + file_name2 : "file:///D:/Diploma/Diploma/Diploma/boat.png"
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
                            text: qsTr("   Make darker \n          and  \n   black&white")
                            font.pointSize: parent.width*0.08
                            font.bold: true
                        }

                        MouseArea{
                            id: mouseArea_custom
                            anchors.fill: parent
                            onClicked: {
                                CppClass.black_white(file_name1)
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
                                color: mouseArea_custom1.containsPress ? Qt.darker("pink", 1.5) : "pink"
                            }
                            GradientStop {
                                position: 0.6
                                color: mouseArea_custom1.containsPress ? Qt.darker("red", 2) : Qt.darker("red", 1.5)
                            }
                        }
                        Text{
                            anchors.centerIn: parent
                            text: qsTr("Make grid \n on photo")
                            font.pointSize: parent.width*0.08
                            font.bold: true
                        }

                        MouseArea{
                            id: mouseArea_custom1
                            anchors.fill: parent
                            onClicked: {
                                CppClass.add_grid(file_name1)
                                render_name = file_name1 + "_bw"
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
                                button__1 = false
                                button__2 = false
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
                                stack_view.push(page4)
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
