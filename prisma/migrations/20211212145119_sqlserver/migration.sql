BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[User] (
    [email] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000),
    [user_id] INT NOT NULL IDENTITY(1,1),
    CONSTRAINT [User_pkey] PRIMARY KEY ([user_id]),
    CONSTRAINT [User_email_key] UNIQUE ([email])
);

-- CreateTable
CREATE TABLE [dbo].[Post] (
    [content] NVARCHAR(1000),
    [post_id] INT NOT NULL IDENTITY(1,1),
    [title] NVARCHAR(1000) NOT NULL,
    [author_id] INT,
    CONSTRAINT [Post_pkey] PRIMARY KEY ([post_id])
);

-- CreateTable
CREATE TABLE [dbo].[Profile] (
    [bio] NVARCHAR(1000),
    [profile_id] INT NOT NULL IDENTITY(1,1),
    [user_id] INT NOT NULL,
    CONSTRAINT [Profile_pkey] PRIMARY KEY ([profile_id])
);

-- AddForeignKey
ALTER TABLE [dbo].[Post] ADD CONSTRAINT [Post_author_id_fkey] FOREIGN KEY ([author_id]) REFERENCES [dbo].[User]([user_id]) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE [dbo].[Profile] ADD CONSTRAINT [Profile_user_id_fkey] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User]([user_id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH
