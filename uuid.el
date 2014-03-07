;;; uuid.el --- UUID for Emacs Lisp
;; Copyright (C) 2014 sindikat
;;
;; Author: sindikat <sindikat at mail36 dot net>
;; Version: 0.1
;;
;; This file is not part of GNU Emacs.
;;
;; This file is put into public domain to the extend possible by law.
;;
;;; Commentary:
;;
;; Generate UUID version 4. Uses pseudo-random function `random'.
;;
;;; Code:
(random t)

(defun uuid-create ()
  "Generate UUID Version 4. Returns number. See:
http://www.rfc-archive.org/getrfc.php?rfc=4122, section 4.4

Example of UUIDv4:

\"36c5878b-2112-4173-a114-656284551ae1\""
    (let ((s (apply #'concat
                    (loop repeat 30 ; 2 characters aren't fully random
                          for c = (random 16)
                          collect (format "%01x" c)))))
      (concat (substring s 0 8)
              "-"
              (substring s 8 12)
              "-"
              "4"
              (substring s 12 15)
              "-"
              (elt '("8" "9" "a" "b") (random 4))
              (substring s 15 18)
              "-"
              (substring s 18 30))))

(provide 'uuid)
;;; uuid.el ends here
