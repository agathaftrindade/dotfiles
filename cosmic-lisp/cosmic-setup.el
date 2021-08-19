(provide 'cosmic-setup)

;; Cosmic

(defun cosmic-find-setup-file ()
  (interactive)
  (find-file-existing "~/dotfiles/cosmic-lisp/cosmic-setup.el"))

;; Org mode

(defun cosmic/current-month-journal-file (&optional prefix)
  (concat prefix (downcase (format-time-string "journal-%Y-%B.org")))
  )

(defun cosmic/find-current-month-personal-journal ()
  "Open this month's personal diary file"
  (interactive)
  (let ((personal-journal-dir (or (getenv "PERSONAL_JOURNAL") (concat org-roam-directory "journal/"))))
    (find-file-existing (concat personal-journal-dir (cosmic/current-month-journal-file)))
    )
  )

(defun cosmic/find-current-month-work-journal ()
  "Open this month's work diary file"
  (interactive)

  (let ((work-journal-dir (or (getenv "WORK_JOURNAL") (concat org-roam-directory "org-work/journal/"))))
    (find-file-existing (concat work-journal-dir (cosmic/current-month-journal-file "w")))
    )
  )

;; Natural Sorting

(defun ssplit_ (acc c)
  (let* ((state (car acc))
         (nodes (car(cdr acc)))
         (new_state (cond
                     ((member c '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9)) :num)
                     (t :chr)
                     )))
         (list new_state
               (if (eq state new_state)
                   (cons (cons c (car nodes)) (cdr nodes))
                 (cons (list c) nodes))
               )
         )
  )

(defun ssplit (s)
  (let ((nodes (car (cdr (reduce #'ssplit_ s :initial-value '(:q))))))
    (reverse (map 'list (lambda (x) (concat (reverse x))) nodes))
    ))

(defun compare-nodes (n1 n2)
  (let ((n1-int (cl-parse-integer n1 :junk-allowed t))
        (n2-int (cl-parse-integer n2 :junk-allowed t))
        )
    (cond ((and n1-int n2-int) (- n1-int n2-int))
          ((string-equal n1 n2) 0)
          (t (compare-strings n1 nil nil n2 nil nil))
          )
    )
  )

(defun natural-sort (s1 s2)
  (let* ((s1-nodes (ssplit s1))
         (s2-nodes (ssplit s2))
         (zipped   (mapcar* #'list s1-nodes s2-nodes)))
    (setq last-comp 0)
    (while (and zipped (= last-comp 0))
      (-let (((n1 n2) (pop zipped)))
        (setq last-comp (compare-nodes n1 n2))
        )
      )
    (cond ((> last-comp 0) nil)
          (t t))
           )
  )

(defun cosmic-setup-general-keybindings ()

  (define-key evil-normal-state-map "Q" #'mark-whole-buffer)

  (spacemacs/set-leader-keys "fef" 'cosmic-find-setup-file)

  (spacemacs/set-leader-keys "\`" 'helm-mini)
  (spacemacs/set-leader-keys "<tab>" 'spacemacs/alternate-window)
  (spacemacs/set-leader-keys "-" 'spacemacs/alternate-buffer)

  (spacemacs/set-leader-keys "bH" 'spacemacs/home)
  (spacemacs/set-leader-keys "bl" 'next-buffer)
  (spacemacs/set-leader-keys "bh" 'previous-buffer)

  )

(defun cosmic-setup-snippets ()
  (add-hook 'yas-minor-mode-hook (lambda () (yas-activate-extra-mode 'fundamental-mode)))
  )

(defun cosmic-setup-org ()

  (org-roam-setup)

  ;; (org-babel-do-load-languages
  ;;  'org-babel-load-languages
  ;;  '((python . t)))

  (spacemacs/declare-prefix "o" "Roam")
  (spacemacs/set-leader-keys "of" 'org-roam-node-find)
  (spacemacs/set-leader-keys "oi" 'org-roam-node-insert)
  (spacemacs/set-leader-keys "oc" 'org-roam-capture)
  (spacemacs/set-leader-keys "or" 'org-roam-db-sync)
  (spacemacs/set-leader-keys "ot" 'org-roam-buffer)
  (spacemacs/set-leader-keys "oT" 'org-roam-buffer-toggle)
  (spacemacs/set-leader-keys "om" 'cosmic/find-current-month-personal-journal)
  (spacemacs/set-leader-keys "on" 'cosmic/find-current-month-work-journal)

  )

(defun cosmic-setup ()
  (cosmic-setup-general-keybindings)
  (cosmic-setup-snippets)
  (cosmic-setup-org)
  )
