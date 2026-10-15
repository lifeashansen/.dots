function dsh --description 'Exec into docker containers'
    set -l container $argv[1]
    set -l shell $argv[1]

    if test -z "$shell"
        set shell /bin/sh
    end

    docker exec -it $container $shell

end
