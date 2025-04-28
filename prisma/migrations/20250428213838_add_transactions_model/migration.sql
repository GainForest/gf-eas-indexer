-- CreateTable
CREATE TABLE "Transactions" (
    "id" BIGSERIAL NOT NULL,
    "attester" TEXT NOT NULL,
    "timestamp" INTEGER NOT NULL,
    "transaction_id" TEXT NOT NULL,
    "message" TEXT NOT NULL,

    CONSTRAINT "Transactions_pkey" PRIMARY KEY ("id")
);
