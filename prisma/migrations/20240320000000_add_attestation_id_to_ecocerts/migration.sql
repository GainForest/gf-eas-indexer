-- CreateTable
CREATE TABLE "EcocertsInProject" (
    "id" BIGSERIAL PRIMARY KEY,
    "project_id" TEXT NOT NULL,
    "ecocert_id" TEXT NOT NULL,
    "attestation_id" TEXT NOT NULL,
    "attester" TEXT NOT NULL,
    "timestamp" INTEGER NOT NULL
); 