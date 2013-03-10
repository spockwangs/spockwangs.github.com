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

### Declare the constructor and destructor in the header file and define them in the source file when using Pimpl idiom, even if they are empty.

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
