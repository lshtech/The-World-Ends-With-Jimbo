jd_def = JokerDisplay.Definitions


-- D+B --------------------------------------------------------

-- Ice Blow
jd_def["j_twewy_iceBlow"] = {
    line_1 = {
        { text = "+",                                                       colour = lighten(G.C.RED, 0.1) },
        { ref_table = "card.joker_display_values", ref_value = "aDiscards", colour = lighten(G.C.RED, 0.1) },
    },
    line_2 = {
        { text = "(Discards)", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
    },

    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local _, _, scoring_hand = JokerDisplay.evaluate_hand(hand)

        if card.ability.extra.triggered then
            card.joker_display_values.active = false
        else
            local faces = 0

            -- Loops through the scoring_hand and increments the face card counter
            for k, v in pairs(scoring_hand) do
                if not v.debuff and v:is_face() then
                    faces = faces + 1
                end
            end

            card.joker_display_values.active = (faces >= 3) and true or false
        end
        
        card.joker_display_values.aDiscards = card.joker_display_values.active and 3 or 0
    end
}

-- Ice Risers
jd_def["j_twewy_iceRisers"] = {
    line_1 = {
        { text = "+",                                                    colour = lighten(G.C.CHIPS, 0.1) },
        { ref_table = "card.joker_display_values", ref_value = "aHands", colour = lighten(G.C.CHIPS, 0.1) }
    },
    line_2 = {
        { text = "(Hands)", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
    },

    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local faces = false

        -- Checks the scoring_hand for a face card
        for k, v in pairs(hand) do
            if v:is_face() and not v.debuff then
                faces = true
                break
            end
        end

        card.joker_display_values.active = (faces and G.GAME.current_round.discards_left > 0) and true or false
        card.joker_display_values.aHands = card.joker_display_values.active and 1 or 0
    end
}

-- Straitjacket
jd_def["j_twewy_straitjacket"] = {
    line_1 = {
        { text = "+",                              colour = lighten(G.C.BLUE, 0.2) },
        { ref_table = "card.joker_display_values", ref_value = "aHands", colour = lighten(G.C.BLUE, 0.2) }
    },
    line_2 = {
        { text = "(Hands) ",                                        colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { text = "(",                                               colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { ref_table = "card.ability.extra", ref_value = "usesLeft", colour = G.C.ORANGE,           scale = 0.3 },
        { text = "/6)",                                             colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
    },

    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)

        card.joker_display_values.aHands = text == "Straight" and 1 or 0
    end
}

-- End D+B----------------------------------------------------------


-- Dragon Couture --------------------------------------------------

--Self Found
jd_def["j_twewy_selfFound"] = {
    line_2 = {
        { text = "(+",                                              colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { ref_table = "card.ability.extra", ref_value = "handSize", colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { text = ")",                                               colour = G.C.UI.TEXT_INACTIVE, scale = 0.35},
    }
}

-- One Stroke
jd_def["j_twewy_oneStroke"] = {
    line_2 = {
        { text = "(+",                                              colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { ref_table = "card.ability.extra", ref_value = "handSize", colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { text = ")",                                               colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 }
    }
}

-- Swift Storm
jd_def["j_twewy_swiftStorm"] = {
    line_2 = {
        { text = "(+",                                              colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { ref_table = "card.ability.extra", ref_value = "handSize", colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { text = ")",                                               colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 }
    }
}

-- Flames Apart
jd_def["j_twewy_flamesApart"] = {
    line_2 = {
        { text = "(",                                                         colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { ref_table = "card.joker_display_values", ref_value = "active_text",                                scale = 0.35 },
        { text = ")",                                                         colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 }
    },

    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, scoring_hand = JokerDisplay.evaluate_hand(hand)

        card.joker_display_values.active = text == ("Straight Flush" or "Flush House" or "Flush Five" or "Five of a Kind") and true or false
        card.joker_display_values.active_text = card.joker_display_values.active and "Active!" or "Inactive"
    end,
    style_function = function(card, line_1, line_2)
        if line_2 then
            line_2.children[2].config.colour = card.joker_display_values.active and G.C.GREEN or G.C.UI.TEXT_INACTIVE
        end
        return false
    end
}

-- Black Sky
jd_def["j_twewy_blackSky"] = {
    line_2 = {
        { text = "(+",                                              colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { ref_table = "card.ability.extra", ref_value = "handSize", colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { text = ")",                                               colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 }
    }
}

-- Fiery Spirit
jd_def["j_twewy_fierySpirit"] = {
    line_2 = {
        { text = "(+",                                              colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { ref_table = "card.ability.extra", ref_value = "handSize", colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 },
        { text = ")",                                               colour = G.C.UI.TEXT_INACTIVE, scale = 0.35 }
    }
}

-- End Dragon Couture ----------------------------------------------


-- Hip Snake -------------------------------------------------------

-- TODO: Add hip_snake Jokers

-- End Hip Snake ---------------------------------------------------


-- Jupiter of the Monkey -------------------------------------------

-- TODO: Add jupiter_of_the_monkey Jokers

-- End Jupiter of the Monkey ---------------------------------------


-- Lapin Angelique -------------------------------------------------

-- Lolita Bat
jd_def["j_twewy_lolitaBat"] = {
    line_1 = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xMult" }
            }
        }
    },
    line_2 = {
        { text = "(",                                                                  colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { ref_table = "card.joker_display_values", ref_value = "inactive_text",        colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { ref_table = "card.joker_display_values", ref_value = "timer_text",           colour = G.C.IMPORTANT,        scale = 0.3 },
        { ref_table = "card.joker_display_values", ref_value = "hands_remaining_text", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { text = ")",                                                                  colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
    },

    calc_function = function(card)
        card.joker_display_values.inactive = (card.ability.extra.timer == 0) and true or false

        card.joker_display_values.xMult = card.joker_display_values.inactive and 1 or card.ability.extra.xMult
        card.joker_display_values.inactive_text = card.joker_display_values.inactive and "Inactive!" or ""
        card.joker_display_values.timer_text = card.joker_display_values.inactive and "" or card.ability.extra.timer
        card.joker_display_values.hands_remaining_text = card.joker_display_values.inactive and "" or "/8"
    end,
}

-- Skull Rabbit
jd_def["j_twewy_skullRabbit"] = {
    line_1 = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xMult"}
            }
        }
    },
    line_2 = {
        { text = "(<", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { text = "$4", colour = G.C.MONEY,            scale = 0.3 },
        { text = ")",  colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
    }
}

-- Web Spider
jd_def["j_twewy_webSpider"] = {
    line_1 = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xMult" }
            }
        }
    },
    line_2 = {
        { text = "(Level 2)", colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
    },

    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)

        card.joker_display_values.xMult = text and G.GAME.hands[text] and (G.GAME.hands[text].level == 2) and card.ability.extra.xMult or 1
    end
}

-- Lolita Skull
jd_def["j_twewy_lolitaSkull"] = {
    line_1 = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xMult" }
            }
        }
    },

    calc_function = function(card)
        local playing_hand = next(G.play.cards)
        local count = 0
        for k, v in ipairs(G.hand.cards) do
            if playing_hand or not v.highlighted then
                if not (v.facing == 'back') and not v.debuff and v:is_suit("Hearts") then
                    count = count + 1
                end
            end
        end

        card.joker_display_values.xMult = (count >= 4) and card.ability.extra.xMult or 1
    end
}

-- Lolita Mic
jd_def["j_twewy_lolitaMic"] = {
    line_1 = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xMult" }
            }
        }
    },
    line_2 = {
        { text = "(",                                                  colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { ref_table = "card.ability.extra", ref_value = "lastDiscard", colour = G.C.IMPORTANT,        scale = 0.3 },
        { text = ")",                                                  colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
    },

    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local text, _, _ = JokerDisplay.evaluate_hand(hand)

        card.joker_display_values.xMult = text and (text == card.ability.extra.lastDiscard) and card.ability.extra.xMult or 1
    end
}

-- Kaleidoscope
jd_def["j_twewy_kaleidoscope"] = {
    line_1 = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "xMult" }
            }
        }
    },
    
    calc_function = function(card)
        local hand = next(G.play.cards) and G.play.cards or G.hand.highlighted
        local _, _, scoring_hand = JokerDisplay.evaluate_hand(hand)

        local count = 0

        -- Loops through each card in the scoring_hand and compares
        -- its suit to the suits in the last scored hand (Indicated by card.ability.extra.progressList)
        for i, v in ipairs(scoring_hand) do
            for k, w in pairs(card.ability.extra.progressList) do
                if v:is_suit(k.."") and not w then
                    count = count + JokerDisplay.calculate_card_triggers(v)
                end
            end
        end

        card.joker_display_values.xMult = tonumber(string.format("%.2f", card.ability.extra.xMult ^ count))
    end
}

-- Lolita Chopper
jd_def["j_twewy_lolitaChopper"] = {
    line_1 = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xMult" }
            }
        }
    },
    line_2 = {
        { text = "(",                                                              colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 },
        { ref_table = "card.joker_display_values", ref_value = "most_played_hand", colour = G.C.IMPORTANT,        scale = 0.3 },
        { text = ")",                                                              colour = G.C.UI.TEXT_INACTIVE, scale = 0.3 }
    },

    calc_function = function(card)
        local most_played_hand = nil

        -- Initializes the most played hand to the first poker hand in the list
        for k, v in pairs(G.GAME.hands) do
            most_played_hand = { k, v }
            break
        end
        
        -- Finds the most played poker hand; It's fine if there are more than one, handled later
        for k, v in pairs(G.GAME.hands) do
            if v.played == most_played_hand[2].played then
                goto continue
            elseif v.played > most_played_hand[2].played then
                most_played_hand = { k, v }
            end

            ::continue::
        end

        local all_equal = true

        -- Loops through each poker hand and checks if they are all equal
        for k, v in pairs(G.GAME.hands) do
            for l, w in pairs(G.GAME.hands) do
                if v.played ~= w.played then
                    all_equal = false
                end
            end
        end

        local multiple_most_played = false

        -- If they are not all equal, checks if their are multiple most played poker hands
        if not all_equal then
            for k, v in pairs(G.GAME.hands) do
                if k ~= most_played_hand[1] and v.played == most_played_hand[2].played then
                    multiple_most_played = true
                    break
                end
            end
        end

        card.joker_display_values.most_played_hand = all_equal and "All" or (multiple_most_played and "Multiple" or tostring(most_played_hand[1]))
    end
}

-- End Lapin Angelique ---------------------------------------------