/////////////////////MOJAVE SUN EMOTE STORAGE///////////////////////

// Wipe emote - wipes your eyes or gas mask from blur - Rain, pepperspray, you name it.
/datum/emote/living/wipe
	key = "wipe"
	key_third_person = "wipes"
	message = "wipes their eyes."
	emote_type = EMOTE_VISIBLE
	cooldown = 3.5 SECONDS

/datum/emote/living/wipe/run_emote(mob/user, params, type_override, intentional)
	// If they're wearing a gas mask, it's implied they're wiping the mask. Easier to wipe a mask clean rather than your eyes!
	if(HAS_TRAIT(user, TRAIT_WEARING_GAS_MASK))
		message = "wipes their mask."
		playsound(user.loc, 'mojave/sound/ms13effects/gasmask_wipe.ogg', 1, TRUE)
		user.adjust_blurriness(-30)
		return ..()

	if(!HAS_TRAIT(user, TRAIT_WEARING_GAS_MASK))
		user.adjust_blurriness(-10)
		message = "wipes their eyes."
		return ..()

// AGONY emote - Express that delicious pain!
/datum/emote/living/agony
	key = "agony"
	key_third_person = "screams"
	message = "screams in utter agony!"
	emote_type = EMOTE_AUDIBLE
