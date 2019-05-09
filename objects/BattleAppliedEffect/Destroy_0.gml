// Don't destroy the instances in the action queue when this object
// is destroyed. They live on in the Battle.individual_actions queue.

ds_queue_destroy(scheduled_actions);

