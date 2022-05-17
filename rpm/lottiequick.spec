Name: lottiequick
Version: 0.1.0
Release: 1
Summary: Qt Quick library for rendering Lottie animations
License: LGPLv2
Source: %{name}-%{version}.tar.bz2
BuildRequires: pkgconfig(Qt5Core)
BuildRequires: pkgconfig(Qt5Gui)
BuildRequires: pkgconfig(Qt5Quick)
BuildRequires: pkgconfig(zlib)
BuildRequires: cmake

%description
%{summary}.

%package devel
Summary: Development files for %{name}
Requires: %{name} = %{version}-%{release}

%description devel
%{summary}.

%package -n org.example.lottiequick
Summary: Example for %{name}

%description -n org.example.lottiequick
%{summary}.

%prep
%autosetup

%build
# ARCH variable is set to fix pixman build on armv7hl
%cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DARCH="%{_arch}" \
    -DLOTTIE_QUICK_BUILD_SAILFISH_EXAMPLE=ON
%make_build

%install
%make_install

%files
%{_libdir}/liblottiequick.so.*

%files devel
%{_libdir}/liblottiequick.so
%{_libdir}/cmake/LottieQuick
%{_libdir}/pkgconfig/lottiequick.pc
%{_includedir}/%{name}/lottiequickglobal.h
%{_includedir}/%{name}/lottieanimation.h

%files -n org.example.lottiequick
%{_bindir}/org.example.lottiequick
%{_datadir}/org.example.lottiequick
%{_datadir}/applications/org.example.lottiequick.desktop
%{_datadir}/icons/hicolor/*/apps/org.example.lottiequick.png
