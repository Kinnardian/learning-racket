#lang br
(define (read-syntax src-path src-port)
    (define src-strs (port->lines src-port))
    (define (make-datum str) (format-datum '(dispatch ~a) str))
    (define src-exprs (map make-datum src-strs))  
    (inject-syntax ([#'(src-expr ... ) src-exprs])
        #'(module stacker-mod "stacker-lang.rkt"
            src-expr ...)
    )
)

(provide read-syntax)

(define #'(stacker-module-begin reader-line ...)
    #'(#%module-begin
        reader-line ...
    )
)
(provide (rename-out [stacker-module-begin #%module-begin]))