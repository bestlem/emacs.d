;;; SQL
(autoload 'sql "sql-mode"
  "Start the interactive SQL interpreter in a new buffer." t)

(autoload 'sql-mode "sql-mode"
  "Mode for editing SQL files and running a SQL interpreter." t)

(autoload 'sql-buffer "sql-mode"
  "Create or move to the sql-mode \"*SQL commands*\" buffer." t)

(setq auto-mode-alist (cons '("\\.sql$" . sql-mode) auto-mode-alist))
