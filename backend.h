#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <qqml.h>
#include <string>
#include <iostream>
#include <vector>
#include <sstream>
#include "dnn.h"
#include "face.h"
#include "grabcut.h"
#include "Black_white.h"
#include "Tracker.h"

using namespace std;

class BackEnd : public QObject
{
    Q_OBJECT


public:
    explicit BackEnd(QObject *parent = nullptr){};
    Q_INVOKABLE void dnnSlot(const QString &msg);
    Q_INVOKABLE void haarSlot(const QString &msg);
    Q_INVOKABLE void grab_cut(const QString &msg);
    Q_INVOKABLE void black_white(const QString &msg);
    Q_INVOKABLE void add_grid(const QString &msg);
    Q_INVOKABLE void find_common(const QString& msg, const QString& msg1);
    Q_INVOKABLE void make_name(QString msg);
    Q_INVOKABLE void make_render(QString msg);
    Q_INVOKABLE void make_picture(QString msg);
    Q_INVOKABLE QString get_name1();
    Q_INVOKABLE QString get_name2();
    Q_INVOKABLE QString get_render();
    Q_INVOKABLE QString get_picture();


private:
    QString m_userName;
    string name1 = "nothing1";
    string name2 = "nothing2";
    string render = "render";
    string picture = "picture";

};
#endif // BACKEND_H

