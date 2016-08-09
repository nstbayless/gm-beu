//dialogue_free()

for (var i=0;i<dialogue.queue_n;i++)
    with dialogue.queue_v[i] instance_destroy();
dialogue.queue_n=0;
