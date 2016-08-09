//dialogue_lock()

if (dialogue.is_locked)
    return false;
dialogue.is_locked=true;
return true;
