if argument_count>0
    chapter = argument[0]
else
    chapter=campaign.chapter

len = array_length_1d(campaign.art)
n=irandom(len-1)

return campaign.art[n];
