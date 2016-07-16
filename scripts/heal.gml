//heal(actor,amount)
actor=argument0
amount=argument1

with (actor) {
    hp+=amount;
    if (hp>stat_hpmax)
        hp=stat_hpmax;
}
