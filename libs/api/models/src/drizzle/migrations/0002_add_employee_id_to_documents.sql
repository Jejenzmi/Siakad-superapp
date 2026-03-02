ALTER TABLE "app_documents" ADD COLUMN "employee_id" uuid;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "app_documents" ADD CONSTRAINT "app_documents_employee_id_app_employees_id_fk" FOREIGN KEY ("employee_id") REFERENCES "public"."app_employees"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
