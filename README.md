Для экспорта настроек из файла

```
code --list-extensions | jq -R -n '[inputs | {name: .}]' > vscode_extensions.txt
```
