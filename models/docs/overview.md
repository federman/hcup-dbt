{% docs __overview__ %}

## Welcome to UHC HCUP documentation!

This site is meant to provide documentation for HCUP data resources. HCUP is a `... insert summary of HCUP and why it may be useful for UHC/DSPH'

## Navigation

You can use the Project and Database navigation tabs on the left side of the window to explore the models in your project. We recomend you stick with `Projects` as we have more control over how its organized. 

There are two sections of the documentation useful for end-users:

### Sources 

The Sources section contains documentation for all of the original HCUP data. It is organized by database (folder) then file (file). It includes database/file summaries as well as what columns are avaiable for each file. 
 


###  Projects > hcup > models

In DBT the term `model` refers to a specific table within a database. The `models` folder contains code/blueprint for each of these specific tables. 


  
- **base** this folder contains very simple base tables derived from our source data. The only logic contained in these models are basic column selection, renaming and type casting. The should match 1 to 1 with our source tables. This folder is organized by source database (folder) and then by model (file). End-users should not need to interact with this folder.
- **intermediate** this folder contains intermediate tables that are derived from the base tables. These tables  contain merges and some basic transformations (e.g. recoding of certain variables or creation of indicator variables). This folder is organized by business/research use case (folder) and then by model (file). End-users should not need to interact with this folder.
- **marts** In DBT, a `mart` type model is a subset of the larger data warehouse derived from intermediate models; `mart` models focus on a specific subject area or research use case and is designed to be consumed by end-users. This folder is organized by business/research use case (folder) and then by source file (model). **End-users should interact with this folder.**


### Other folders

These folders are intended for end-users to interact with directly. But they do allow documentation on on the macros use in some of the intermediate and mart models. 

- **Projects > hcup > macros**: this folder contains the reusable functions aka `macros` that we wrote for this project. You can navigate through this folder to find documentation for each macro. Using macros allow us to write more concise code and avoid repeating ourselves. We split models into several folders similar to best practices recommended by the DBT community.
- **Projects > hcup > analyses** (as a end-user you can ignore this one. Its mostly for internal testing.)

{% enddocs %}