-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "profileImage" TEXT,
    "bio" TEXT,
    "class" INTEGER,
    "settings" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "examId" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserInteraction" (
    "id" TEXT NOT NULL,
    "followerId" TEXT NOT NULL,
    "followingId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT,

    CONSTRAINT "UserInteraction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Board" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "classes" INTEGER[],

    CONSTRAINT "Board_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subject" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "boardId" TEXT NOT NULL,

    CONSTRAINT "Subject_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Question" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "boardId" TEXT,
    "classId" INTEGER,
    "subjectId" TEXT,
    "competitiveExamId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Question_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Answer" (
    "id" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Answer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompetitiveExam" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "CompetitiveExam_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "read" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exam" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "questions" JSONB NOT NULL,

    CONSTRAINT "Exam_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InteractiveFeature" (
    "id" TEXT NOT NULL,
    "featureName" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "settings" JSONB NOT NULL,

    CONSTRAINT "InteractiveFeature_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CompetitiveExamToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "UserInteraction_followerId_followingId_key" ON "UserInteraction"("followerId", "followingId");

-- CreateIndex
CREATE UNIQUE INDEX "Board_name_key" ON "Board"("name");

-- CreateIndex
CREATE UNIQUE INDEX "CompetitiveExam_name_key" ON "CompetitiveExam"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_CompetitiveExamToUser_AB_unique" ON "_CompetitiveExamToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_CompetitiveExamToUser_B_index" ON "_CompetitiveExamToUser"("B");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_examId_fkey" FOREIGN KEY ("examId") REFERENCES "Exam"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserInteraction" ADD CONSTRAINT "UserInteraction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subject" ADD CONSTRAINT "Subject_boardId_fkey" FOREIGN KEY ("boardId") REFERENCES "Board"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Question" ADD CONSTRAINT "Question_competitiveExamId_fkey" FOREIGN KEY ("competitiveExamId") REFERENCES "CompetitiveExam"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetitiveExamToUser" ADD CONSTRAINT "_CompetitiveExamToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "CompetitiveExam"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CompetitiveExamToUser" ADD CONSTRAINT "_CompetitiveExamToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
