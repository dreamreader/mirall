/*
 * Copyright (C) by Daniel Molkentin <danimo@owncloud.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * for more details.
 */

#ifndef UPDATER_H
#define UPDATER_H

#include <QObject>

namespace Mirall {


class Updater {
public:
    struct Helper {
        static qint64 stringVersionToInt(const QString& version);
        static qint64 currentVersionToInt();
        static qint64 versionToInt(qint64 major, qint64 minor, qint64 patch, qint64 build);
    };

    static Updater *instance();

    virtual void checkForUpdate() = 0;
    virtual void backgroundCheckForUpdate() = 0;

    virtual bool handleStartup() = 0;

private:
    static Updater *create();
    static Updater *_instance;
};

} // namespace Mirall

#endif // UPDATER_H
