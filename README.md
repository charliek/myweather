# Demo application

This is a very simple (and bad) ratpack application that I put together to show different methods of
deploying an application.  The slide deck for the application can be found on [speaker deck](https://speakerdeck.com/charliek/deploy-tooling-overview)
and [google docs](https://docs.google.com/presentation/d/1_55mi9v9o0lDT_j76-kZD3lkI_9XC3lUEQ2OAKGH6eQ/pub?start=false&loop=false&delayms=3000).

See the build.gradle file to see how you can build a debian package and push docker container from
your build.  Look in the terraform directory to see what a simple [terraform](http://www.terraform.io/)
file might look like. See the cloudformation directory to see a simple cloudformation example, and the
packer directory for a [packer](http://www.packer.io/) example.  The salt directory shows how you might
structure a [saltstack](http://docs.saltstack.com/en/latest/) project but is unfortunately pretty
incomplete (but should work I think).

If you run into questions let me know (charlie.knudsen@gmail.com) and I'll try to help.
