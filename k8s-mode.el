;;; k8s-mode.el --- Major mode for Kubernetes configuration file -*- lexical-binding: t -*-

;; Copyright (C) 2019 Giap Tran <txgvnn@gmail.com>

;; Author: Giap Tran <txgvnn@gmail.com>
;; URL: https://github.com/TxGVNN/emacs-k8s-mode
;; Version: 0.1
;; Package-Requires: ((emacs "24.3") (yaml-mode "0.0.10"))

;;; Commentary:
;; After open Kubernetes file, you have to M-x k8s-mode to enable this major
;; Put # -*- mode: k8s -*- in first line of file, if you want to autoload
;;; Code:

(require 'yaml-mode)


(defgroup k8s nil
  "Major mode of K8s configuration file."
  :group 'languages
  :prefix "k8s-")

(defcustom k8s-mode-hook nil
  "*Hook run by `k8s-mode'."
  :type 'hook
  :group 'k8s)

(defcustom k8s-indent-offset 2
  "The tab width to use when indenting."
  :type 'integer
  :group 'k8s)

(defvar k8s-keywords
  '("apiVersion"))

(defvar k8s-font-lock-keywords
  `((,(regexp-opt k8s-keywords) . font-lock-builtin-face)
    ,@yaml-font-lock-keywords))

;; Yasnippet
(defconst k8s-dir (file-name-directory (or load-file-name
                                           buffer-file-name)))
(defconst k8s-snip-dir (expand-file-name "snippets" k8s-dir))

;; Completion
(defun k8s-complete-at-point ()
  "Perform keyword completion on word before cursor."
  (let* ((end (point))
         (begin (save-excursion
                  (skip-chars-backward "^ \n\r\t,:")
                  (point))))
    (list begin end k8s-keywords
          :exclusive 'no
          :company-docsig #'identity)))

;;;###autoload
(define-derived-mode k8s-mode yaml-mode "K8S"
  "Major mode for editing k8s configuration file"
  (font-lock-add-keywords nil k8s-font-lock-keywords)
  ;; indentation
  (set (make-local-variable 'yaml-indent-offset) k8s-indent-offset)
  ;; completion
  (set (make-local-variable 'completion-at-point-functions) '(k8s-complete-at-point))
  ;; yasnippet
  (when (featurep 'yasnippet)
    ;; (add-to-list 'yas-snippet-dirs k8s-snip-dir t)
    (yas-load-directory k8s-snip-dir)
    (yas-minor-mode)))

(provide 'k8s-mode)

;;; k8s-mode.el ends here
