//dialogue_lock()

if (dialogue.is_locked)
    return false;
dialogue.is_locked=true;
dialogue.control_n=campaign.pc_count;
for (var i=0;i<dialogue.control_n;i++)
    dialogue.control_v[i]=i;
return true;
