/*
  Warnings:

  - You are about to drop the column `refUUID` on the `Attestation` table. All the data in the column will be lost.
  - Added the required column `ipfsHash` to the `Attestation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isOffchain` to the `Attestation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `refUID` to the `Attestation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `revocable` to the `Attestation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timeCreated` to the `Attestation` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `time` on the `Attestation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `expirationTime` on the `Attestation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `revocationTime` on the `Attestation` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `revocable` to the `Schema` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `time` on the `Schema` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `time` on the `SchemaName` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Attestation" DROP COLUMN "refUUID",
ADD COLUMN     "decodedDataJson" TEXT NOT NULL DEFAULT '',
ADD COLUMN     "ipfsHash" TEXT NOT NULL,
ADD COLUMN     "isOffchain" BOOLEAN NOT NULL,
ADD COLUMN     "refUID" TEXT NOT NULL,
ADD COLUMN     "revocable" BOOLEAN NOT NULL,
ADD COLUMN     "timeCreated" INTEGER NOT NULL,
DROP COLUMN "time",
ADD COLUMN     "time" INTEGER NOT NULL,
DROP COLUMN "expirationTime",
ADD COLUMN     "expirationTime" INTEGER NOT NULL,
DROP COLUMN "revocationTime",
ADD COLUMN     "revocationTime" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Schema" ADD COLUMN     "revocable" BOOLEAN NOT NULL,
DROP COLUMN "time",
ADD COLUMN     "time" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "SchemaName" DROP COLUMN "time",
ADD COLUMN     "time" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Timestamp" (
    "id" TEXT NOT NULL,
    "from" TEXT NOT NULL,
    "txid" TEXT NOT NULL,
    "tree" TEXT NOT NULL DEFAULT '',
    "timestamp" INTEGER NOT NULL,

    CONSTRAINT "Timestamp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OffchainRevocation" (
    "id" TEXT NOT NULL,
    "from" TEXT NOT NULL,
    "uid" TEXT NOT NULL,
    "txid" TEXT NOT NULL,
    "timestamp" INTEGER NOT NULL,

    CONSTRAINT "OffchainRevocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EnsName" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "timestamp" INTEGER NOT NULL,

    CONSTRAINT "EnsName_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transactions" (
    "id" BIGSERIAL NOT NULL,
    "attester" TEXT NOT NULL,
    "timestamp" INTEGER NOT NULL,
    "transaction_id" TEXT NOT NULL,
    "message" TEXT NOT NULL,

    CONSTRAINT "Transactions_pkey" PRIMARY KEY ("id")
);
