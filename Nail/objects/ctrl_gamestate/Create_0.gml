
// NOTE: ALL FIELDS ARE READ-WRITE UNLESS OTHERWISE STATED!!!

briefcaseState = BriefcaseState.UNTOUCHED;

investedValue = -1;

mobFavor = 0;

playerHasSoul = true;
playerWorksForSatan = false;

boughtSouls = {};

soulsDelivered = 0; // Doesn't count your own soul!

charHasSoul = function(soulId) {
  return !variable_struct_exists(boughtSouls, soulId);
}

takeCharSoul = function(soulId) {
  boughtSouls[$ soulId] = 1;
}
