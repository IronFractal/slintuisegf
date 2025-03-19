/**
 * @file main.cpp
 * @author James Hatfield
 * @date 2025-03-18
 * SPDX-License-Identifier: MIT
 */
#include <cstdlib>
#include <unistd.h>

#include "segf_win.h"

int main(int /*argc*/, char **/*argv*/)
{
    slint::ComponentHandle<SegfWindow> win = SegfWindow::create();

    win->on_quit([&win]()
    {
        win->hide();
    });

    win->run();

    return EXIT_SUCCESS;
}
