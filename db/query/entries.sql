-- name: CreateEntry :one
INSERT INTO entries (
    account_id, 
    amount
) VALUES (
    $1, $2
) RETURNING *;

-- name: GetEntry :one
SELECT * FROM entries
WHERE id = $1 LIMIT 1;

-- name: ListEntries :many
SELECT * from entries
ORDER BY name
LIMIT $1
OFFSET $2;

-- name: UpdateEntry :exec 
UPDATE entries
SET amount = $2
WHERE id = $1
RETURNING *;

-- name: DeleteEntry :exec 
DELETE FROM entries
WHERE id = $1;