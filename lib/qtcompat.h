#ifndef LOTTIE_QUICK_QT_COMPAT_H
#define LOTTIE_QUICK_QT_COMPAT_H

#include <QtGlobal>

// Deal with old Qt which we have in Sailfish OS
#if QT_VERSION < QT_VERSION_CHECK(5, 7, 0)

// Add const to non-const objects (like std::as_const)
template<typename T>
constexpr typename std::add_const<T>::type &qAsConst(T &t) noexcept
{
    return t;
}

// Prevent rvalue arguments
template<typename T>
void qAsConst(const T &&) = delete;

#endif

#endif // LOTTIE_QUICK_QT_COMPAT_H
