function updater()
    pathname = retr('pathname');

a=dir([pathname '/*.jpg']);
        out=size(a,1)
        if out>Num_images
            sequencer
        end
