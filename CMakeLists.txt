cmake_minimum_required(VERSION 4.1)
project(Espardu_IoT)

set(CMAKE_CXX_STANDARD 14)

add_executable(Espardu_IoT
        sandbox/ESP-32/src/wifi-ble-connection/wifi_ble_connection.cpp
        sandbox/ESP-32/src/main.cpp
        venv/Lib/site-packages/markupsafe/_speedups.c)
