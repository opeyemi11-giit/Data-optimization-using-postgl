

CREATE OR REPLACE VIEW analytics.clinical_trial_funnel AS
SELECT
    ct.phase AS trial_phase,
    COUNT(tp.participant_id) AS total_participants
FROM research.clinical_trials ct
JOIN research.trial_participants tp
    ON ct.trial_id = tp.trial_id
WHERE ct.status IN ('Active', 'Recruiting')
GROUP BY
    ct.phase
ORDER BY
    ct.phase;

