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

%package example
Summary: Example for %{name}

%description example
%{summary}.

%prep
%autosetup

%build
# ARCH variable is set to fix pixman build on armv7hl
%cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DARCH="%{_arch}" \
    -DBUILD_LOTTIE_QUICK_SAILFISH_EXAMPLE=ON
%make_build

%install
%make_install

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%{_libdir}/liblottiequick.so.*

%files devel
%{_libdir}/liblottiequick.so
%{_libdir}/cmake/LottieQuick
%{_libdir}/pkgconfig/lottiequick.pc
%{_includedir}/%{name}/lottiequickglobal.h
%{_includedir}/%{name}/lottieanimation.h

%files example
%{_bindir}/%{name}-example
%{_datadir}/%{name}-example
%{_datadir}/applications/%{name}-example.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}-example.png
