CONFIG += c++1z strict_c++
CONFIG -= qt

TEMPLATE = app
CONFIG += console
TARGET = tests
DESTDIR = $${PWD}/../bin

win*{
	QMAKE_CXXFLAGS += /std:c++17 /permissive- /Zc:__cplusplus

	QMAKE_CXXFLAGS += /MP /Zi /FS
	QMAKE_CXXFLAGS += /wd4251
	QMAKE_CXXFLAGS_WARN_ON = /W4
	DEFINES += WIN32_LEAN_AND_MEAN NOMINMAX _SCL_SECURE_NO_WARNINGS

	QMAKE_LFLAGS += /DEBUG:FASTLINK

	Debug:QMAKE_LFLAGS += /INCREMENTAL
	Release:QMAKE_LFLAGS += /OPT:REF /OPT:ICF
}

linux*|mac*{
	QMAKE_CXXFLAGS_WARN_ON = -Wall -Wno-c++11-extensions -Wno-local-type-template-args -Wno-deprecated-register

	Release:DEFINES += NDEBUG=1
	Debug:DEFINES += _DEBUG
}

INCLUDEPATH += $${PWD}/../../


HEADERS += \
	catch2_helpers.hpp \
	container_tests.hpp \
	extra_type_traits_tests.hpp \
	parameter_pack_tests.hpp \
	tuple_helpers_tests.hpp

SOURCES += tests_main.cpp