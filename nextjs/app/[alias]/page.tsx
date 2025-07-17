// BH

import { redirect } from "next/navigation";

export default async function Page({
  params,
}: {
  params: Promise<{ alias: string }>
}) {
  
  // fetch record
  const { alias } = await params
  const destinationUrl = 'https://www.google.com/'
  
  // tbd analytics


  return (
    redirect(destinationUrl)
  );
}