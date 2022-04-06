#

## Goal

I'm trying to install a software (and its dependencies) into a virtualenv.

This virtualenv will then be packaged into a RPM archive and should work on its own.

## Results

### What is observed

When `poetry` is used to install the software, the software stops working as soon as the source directory is deleted.

Relying on `pip` to install the software does not have this problem.

![poetry_vs_pip_install](doc/poetry_pip_venv_install.gif)

### Conclusion

I must be misusing `poetry` or have misunderstood its goal...
