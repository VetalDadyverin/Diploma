import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    id : window1
    visible: true
    minimumWidth: 1024
    minimumHeight: 576
    width: 1280//1920
    height: 720//1080
    title: qsTr("Hello World")
    property string file_name: "aa"
    property string file_name1: "aa"
    property string file_name2: "aa"
    property string render_name: "file:///D:/Diploma/Diploma/Diploma/boat"
    property string picture_name: "aa"
    property string which: "aa"



    /*Button {
        id: button1
        text: "Click me"
        anchors.centerIn: parent
        onClicked:{
            window1.color = Qt.rgba(Math.random(), Math.random(),Math.random());
        }
    }*/


    StackView {
        id: stack_view
        anchors.fill: parent
        initialItem: page1
    }


    Page_1 {
        id: page1
    }

    Page_2 {
        id: page2
        visible: false
    }

    Page_3 {
        id: page3
        visible: false
    }

    Page_4 {
        id: page4
        visible: false
    }

    Page_5 {
        id: page5
        visible: false
    }

}



