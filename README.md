# monorepo


Using -W instructs Yarn to install the given dependencies for the entire workspace. These dependencies are usually shared between all packages.


lerna exec will take any command and run it over all of the different packages.


Using --root-mode upward is the special sauce to using Yarn workspaces. This tells Babel the node_modules are located in the root instead of nested inside each of the individual packages. This prevents each package from having the same node_modules and extracts them up to the root. We’ll be utilizing a similar approach for testing later.
