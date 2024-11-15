# Elusiv

# Feature File Structure
```
Feature
├── Repositories
├── Domain
│   ├── Entities
│   └── Providers
└── Presentation
    ├── Pages
    └── Widgets
```
# Layers
## Repositories
- Contains singleton classes used for retrieving data.
## Domain
- **Entities**: Data classes and their functions.
- **Providers**: Providers which connect the repositories to the presentation layer.
## Presentation
- **Pages**: Contains main page widgets.
- **Widgets**: Contains smaller widgets used in pages.