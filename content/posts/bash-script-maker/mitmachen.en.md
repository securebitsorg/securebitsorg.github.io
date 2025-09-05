---
title: Get involved in development
description: Contribute or translate for the Bash Script Maker app
date: 2025-09-02T05:50:29.842Z
preview: ../../../assets/images/bash-maker/Bash-Script-Maker.webp
hero: /images/bash-maker/Bash-Script-Maker.webp
categories:
    - Linux
    - Bash-Script-Maker
    - Scripting
tags:
    - bash
    - bash-script-maker
    - linux
menu:
    sidebar:
        name: Programming or translating
        identifier: program-maker
        parent: maker
keywords:
    - development bash-script-maker
---
## Contribute to the Bash Script Maker app

Thank you for wanting to contribute to Bash Script Maker! We welcome all contributions that improve our project.

### Technical details

- **GUI framework**: Tkinter
- **Syntax highlighting**: Regex-based pattern recognition
- **File format**: Pure Bash scripts (.sh)
- **Encoding**: UTF-8
- **Platform**: Linux (due to Zenity dependency)

### CI/CD Pipeline

This project uses GitHub Actions for continuous integration and deployment.

## Quick start for contributors:
1. Fork the repository
2. `git clone https://github.com/securebitsorg/bash-script-maker.git`
3. `cd bash-script-maker && ./install.sh`
4. `pip install -e “.[dev]”`
5. `pre-commit install`
6. Develop and test
7. `./init_github.sh` (for automatic push)
8. Create pull request


## Set up development environment

### Requirements
- Python 3.6+
- Git
- Linux system (for Tkinter and Zenity)

### Setup
1. Fork the repository
2. Clone your fork:
```bash
   git clone https://github.com/securebitsorg/bash-script-maker.git
   cd bash-script-maker
   ```

3. Install dependencies:
   ```bash
   pip install -e “.[dev]”
   ```

4. Install pre-commit hooks:
   ```bash
   pip install pre-commit
   pre-commit install
   ```

## Development workflow

### 1. Create a branch
```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-number
```

### 2. Write code
- Follow the existing code style
- Write meaningful commit messages
- Test your changes

### 3. Pre-commit checks
```bash
pre-commit run --all-files
```

### 4. Run tests
```bash
tox
# or specific tests
tox -e py39,lint,type
```

### 5. Create pull request
- Push your branch
- Create a pull request on GitHub
- Describe your changes in detail

## Code standards

### Python
- Use **Black** for code formatting
- Follow PEP 8
- Use type hints where possible
- Write docstrings for all public functions

### Git Commits
- Use concise, descriptive commit messages
- Start with a verb (Add, Fix, Update, Remove)
- Reference issues with `#issue-number`

Examples:
```
feat: add autocomplete for bash commands
fix: resolve tab indentation bug in editor
docs: update installation instructions
```

### Branch names
- Features: `feature/feature-name`
- Bug fixes: `fix/issue-number`
- Hotfixes: `hotfix/issue-number`
- Documentation: `docs/topic`

## Testing

### Unit Tests
```bash
pytest
```

### Integration Tests
```bash
python -c “import bash_script_maker; import syntax_highlighter”
```

### Linting and Type Checking
```bash
flake8 bash_script_maker.py syntax_highlighter.py
mypy bash_script_maker.py syntax_highlighter.py
black --check bash_script_maker.py syntax_highlighter.py
```

## Documentation

### Code Documentation
- Use Google-style docstrings
- Document all parameters, return values, and exceptions
- Keep comments in English

### Project Documentation
- Update README.md when new features are added
- Add changes to CHANGELOG.md
- Update CONTRIBUTING.md as needed

## Releases

Releases are created automatically via GitHub Actions:

### Patch Release (e.g., 1.0.1)
```bash
git tag v1.0.1
git push origin v1.0.1
```

### Minor Release (e.g., 1.1.0)
```bash
git tag v1.1.0
git push origin v1.1.0
```

### Major Release (e.g., 2.0.0)
```bash
git tag v2.0.0
git push origin v2.0.0
```


## Contribute translations

We welcome help translating Bash Script Maker into new languages!

**How to add a new language:**

1.  **Find the language code:** Find the two-letter ISO 639-1 code for your language (e.g., `fr` for French).

2.  **Create a directory:** Create a new directory under `locales/`. For French, this would be `locales/fr/LC_MESSAGES/`.

3.  **Create a translation file:**
    *   Copy the English template file: `cp locales/en/LC_MESSAGES/base.po locales/fr/LC_MESSAGES/base.po`
*   Open the new `.po` file with a text editor or a special tool such as [Poedit](https://poedit.net/).

4.  **Translate texts:**
*   Go through the file and translate all texts that appear in `msgid “...”`.
*   Enter your translation in the `msgstr “...”` field directly below.
*   **Important:** Leave placeholders such as `{}` unchanged.

    **Example:**
```po
msgid “File”
msgstr “File”

msgid “Script saved: {}”
msgstr “Script saved: {}”
```

5.  **Compile the translation:**
*   Your translation must be compiled so that the program can use it. To do this, simply run the supplied script:
```bash
python compile_translations.py
```
* This script may require the `polib` library. If it is not available, install it with: `pip install polib`.

6.  **Add language to the menu:**
    * Open the file `bash_script_maker.py`.
* Search for `language_menu`.
* Add a new entry for your language, similar to the existing ones for German and English.

7.  **Create a pull request:** Create a pull request with your changes so that we can add the new language to the project.

Thank you for your help!

### Push repository to GitHub:
```bash
# Automatically (recommended)
./init_github.sh

# Or manually
git add .
git commit -m “Your commit message”
git push
```

## Security

- Do not report security vulnerabilities publicly!!!
- Contact the maintainers directly
- Do not use insecure dependencies
- Run a security scan: `bandit -r .`
bash-script-maker
By contributing to this project, you agree that your contributions are licensed under the MIT license.

## Questions?

If you have any questions:
- Open a [GitHub issue](https://github.com/securebitsorg/bash-script-maker/issues)
- Write in [GitHub Discussions](https://github.com/securebitsorg/bash-script-maker/discussions)
- Contact the maintainers

Thank you for your contribution! 🚀
