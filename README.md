[![MELPA](http://melpa.org/packages/k8s-mode-badge.svg)](http://melpa.org/#/k8s-mode)
[![License](http://img.shields.io/:license-gpl3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html)

# k8s-mode
Kubernetes file mode in Emacs

## Features

- Inherite yaml-mode
- Support yasnippet
- Go to documents site

## Setup

### Manual

From melpa, `M-x package-install RET k8s-mode RET`.

In init file,

``` emacs-lisp
(require 'k8s-mode)
```
### Use-package

``` emacs-lisp
(use-package k8s-mode
  :ensure t
  :hook (k8s-mode . yas-minor-mode))
```

## Customize

### Customization function
From Emacs `M-x customize-group RET k8s RET`

### Manual
```
;; Set indent offset
(setq k8s-indent-offset nil)
```

```

;; The site docs URL
(setq k8s-site-docs-url "https://kubernetes.io/docs/reference/generated/kubernetes-api/")
```
```

;; The defautl API version
(setq k8s-site-docs-version "v1.3")
```
```

;; The browser funtion to browse the docs site. Default is `browse-url-browser-function`
(setq k8s-search-documentation-browser-function nil)
; Should be a X11 browser
;(setq k8s-search-documentation-browser-function (quote browse-url-firefox))

```
