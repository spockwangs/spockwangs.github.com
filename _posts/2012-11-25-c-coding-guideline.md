---
layout: post
title: C++ Coding Guideline
tags:
- Programming
status: publish
type: post
published: true
meta:
  _edit_last: '1'
  _edit_lock: '1353842551'
  _pingme: '1'
  _encloseme: '1'
  _wp_old_slug: ''
---

## Pimpl idiom

**Declare the constructor and destructor in the header file and define them in the source file when using Pimpl idiom, even if they are empty.**

Consider the following code.

    // pimpl.h
    class Impl;    // forward declaration
    class Pimpl {
    public:
       Pimpl();
       
       // The destructor is not declared, so the compiler will generate one.

    private:
        boost::scoped_ptr<Impl> m_impl;
    };

    // pimpl.cc
    class Impl {
         // ...
    };

    Pimpl::Pimpl()
        : m_impl(new Impl)
    {}

If you do not declare the destructor the compiler will generate one in
every translation unit that includes `impl.h`, which will call
the destructor of member variables, that is, the destructor
of `m_impl` which requires the complete definition
of `Impl`. But the whole purpose of Pimpl idiom is to hide the
definition of `Impl`. To solve this problem you should declare
the destructor in the header file to prevent the compiler from generating
one, and define it in the source file. Then only the `impl.cc` requires the
complete definition of `Impl`. Other translation units just
call `Pimpl`'s destructor as an external function, so they don't
need to generate it.

## Prefer anonymous namespace functions to class static functions.

When you are implementing a class's interface, you may need some helper
functions which has no relation with the private (member or static)
data. You can either declare the helper functions as the private static
functions in the class header file, or as the anonymous namespace functions
in the class source file.

Since it does not need to access the private data, the helper function
should be kept out of the class definition to make them loosely
coupled. And it is the implementation's details, which we don't want the
client of the class see it. So if we can put it outside the header file, we
should do it. If we put it in the header file, every time the
implementation changes the client using this class has to be
re-compiled. So we should put the implementation details outside of the
class header file as much as possible.