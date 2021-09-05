#include "backend.h"

void BackEnd::dnnSlot(const QString &msg){
    string sent = msg.toStdString();
    ::dnn(sent);
}


void BackEnd::haarSlot(const QString &msg){
    string sent = msg.toStdString();
    ::face(sent);
}

void BackEnd::grab_cut(const QString &msg){
    string sent = msg.toStdString();
    ::grab_and_cut(sent);
}

void BackEnd::black_white(const QString &msg){
    string sent = msg.toStdString();
    ::black_white(sent);
}

void BackEnd::add_grid(const QString &msg){
    string sent = msg.toStdString();
    ::drawBasicGrid(sent);
}

void BackEnd::find_common(const QString& msg, const QString& msg1){
    string sent = msg.toStdString();
    string sent1 = msg1.toStdString();
    example::tracking_on_photos(sent1, sent);
}


void BackEnd::make_name(QString sentence){
    QStringList list1 = sentence.split('.');
    string sent = sentence.toStdString();
    istringstream iss(sent);
    vector<string> tokens;
    string token;
    while (getline(iss, token, '.')) {
        if (!token.empty())
            tokens.push_back(token);
    }
    name1 = tokens[0];
    name2 = tokens[1];
}

void BackEnd::make_render(QString sentence) {
    QStringList list1 = sentence.split('.');
    string sent = sentence.toStdString();
    istringstream iss(sent);
    vector<string> tokens;
    string token;
    while (getline(iss, token, '.')) {
        if (!token.empty())
            tokens.push_back(token);
    }
    render = tokens[0];
}

void BackEnd::make_picture(QString sentence) {
    QStringList list1 = sentence.split('.');
    string sent = sentence.toStdString();
    istringstream iss(sent);
    vector<string> tokens;
    string token;
    while (getline(iss, token, '.')) {
        if (!token.empty())
            tokens.push_back(token);
    }
    picture = tokens[0];
}

QString BackEnd::get_name1(){
    return QString::fromStdString(name1);
}

QString BackEnd::get_name2(){
    return QString::fromStdString(name2);
}


QString BackEnd::get_render() {
    return QString::fromStdString(render);
}

QString BackEnd::get_picture() {
    return QString::fromStdString(picture);
}
