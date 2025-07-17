// BH

import { redirect } from "next/navigation";
import { db } from "@/lib/db/drizzle";
import { eq } from 'drizzle-orm';
import { shortLinks } from "@/lib/db/schema";
import { notFound } from "next/navigation";

export default async function Page({
  params,
}: {
  params: Promise<{ alias: string }>
}) {
  
  // fetch record
  const { alias } = await params;
  const [ result ] = await db.select({
      destinationUrl: shortLinks.longLink
    })
    .from(shortLinks)
    .where(eq(shortLinks.alias, alias))
    .limit(1);

  if (result) {
    // tbd analytics
    return redirect(result.destinationUrl)
  } else {
    notFound()
  }
}